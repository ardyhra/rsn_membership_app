// In frontend/lib/services/broadcast_service.dart (Create this file)

import 'dart:async';
import 'package:universal_html/html.dart' as html;
import 'package:membership_app_client/membership_app_client.dart';
import 'package:intl/intl.dart'; // For potential date formatting if needed here

// Key for JWT Token storage
const String _jwtTokenStorageKey = 'jwt_token';

// --- State Class ---
class BroadcastState {
  final bool isLoading;
  final List<Broadcast> broadcastList;
  final String? notificationMessage;
  final bool isNotificationSuccess;
  final bool isAddOrEditMode;   // True if form should be shown
  final Broadcast? broadcastToEdit;   // Holds the broadcast for editing, null otherwise
  final Broadcast? broadcastToDelete; // Holds the broadcast for delete confirmation

  BroadcastState({
    this.isLoading = true, // Start loading initially
    this.broadcastList = const [],
    this.notificationMessage,
    this.isNotificationSuccess = true,
    this.isAddOrEditMode = false,
    this.broadcastToEdit,
    this.broadcastToDelete,
  });

  // Helper for copying state with modifications
  BroadcastState copyWith({
    bool? isLoading,
    List<Broadcast>? broadcastList,
    String? notificationMessage,
    bool? isNotificationSuccess,
    bool? clearNotification, // Flag to nullify notification
    bool? isAddOrEditMode,
    Broadcast? broadcastToEdit,
    bool? clearBroadcastToEdit, // Flag to nullify edit object
    Broadcast? broadcastToDelete,
    bool? clearBroadcastToDelete, // Flag to nullify delete object
  }) {
    return BroadcastState(
      isLoading: isLoading ?? this.isLoading,
      broadcastList: broadcastList ?? this.broadcastList,
      notificationMessage: clearNotification == true ? null : notificationMessage ?? this.notificationMessage,
      isNotificationSuccess: isNotificationSuccess ?? this.isNotificationSuccess,
      isAddOrEditMode: isAddOrEditMode ?? this.isAddOrEditMode,
      broadcastToEdit: clearBroadcastToEdit == true ? null : broadcastToEdit ?? this.broadcastToEdit,
      broadcastToDelete: clearBroadcastToDelete == true ? null : broadcastToDelete ?? this.broadcastToDelete,
    );
  }
}

// --- Service Class ---
class BroadcastService {
  static final BroadcastService instance = BroadcastService._internal();
  BroadcastService._internal();

  final Client client = Client('http://localhost:8080/');
  String? _bearerToken; // Store token internally

  // Internal state management
  late BroadcastState _currentState;
  final StreamController<BroadcastState> _stateController = StreamController<BroadcastState>.broadcast();

  // Public stream and initial state getter
  Stream<BroadcastState> get broadcastStateStream => _stateController.stream;
  BroadcastState get currentInitialState => _currentState;

  // Initialize state
  void initialize() {
     _currentState = BroadcastState(); // Set initial state
     _stateController.add(_currentState);
     print("[BroadcastService] Initialized.");
     // Get token immediately (needed for fetches)
     _getTokenFromStorage();
  }

   void _getTokenFromStorage() {
      try {
         String? jwtToken = html.window.localStorage[_jwtTokenStorageKey];
         if (jwtToken != null && jwtToken.isNotEmpty) {
            _bearerToken = 'Bearer $jwtToken';
            print("[BroadcastService] Auth token loaded.");
         } else {
            _bearerToken = null; // Ensure it's null if not found
            print("[BroadcastService] Auth token not found in storage.");
         }
      } catch (e) {
          print("[BroadcastService] Error accessing token from storage: $e");
          _bearerToken = null;
      }
   }

   // Call this if the token might have changed (e.g., after login)
   void refreshToken() {
      _getTokenFromStorage();
   }

  // Helper to update state and notify listeners
  void updateState(BroadcastState newState) { // Renamed from _updateState
    _currentState = newState;
    if (!_stateController.isClosed) {
      _stateController.add(_currentState);
      print("[BroadcastService] State updated: isLoading=${_currentState.isLoading}, listCount=${_currentState.broadcastList.length}, mode=${_currentState.isAddOrEditMode ? 'Form' : 'List'}, editId=${_currentState.broadcastToEdit?.id}, deleteId=${_currentState.broadcastToDelete?.id}");
    } else {
       print("[BroadcastService] WARN: Attempted to update state on closed controller.");
    }
  }

  // --- Public Methods for Actions ---

  Future<void> fetchBroadcasts() async {
    if (_bearerToken == null) {
      updateState(_currentState.copyWith(isLoading: false, notificationMessage: "Authentication required.", isNotificationSuccess: false)); // Call public method
      return;
    }
    updateState(_currentState.copyWith(isLoading: true, clearNotification: true)); // Call public method
    try {
      final data = await client.broadcast.getAllBroadcasts(bearerToken: _bearerToken);
      updateState(_currentState.copyWith(isLoading: false, broadcastList: data)); // Call public method
      print("[BroadcastService] Broadcasts fetched successfully: ${data.length} items.");
    } catch (e) {
      print('[BroadcastService] Error fetching broadcasts: $e');
      updateState(_currentState.copyWith(isLoading: false, notificationMessage: "Gagal memuat data broadcast: $e", isNotificationSuccess: false)); // Call public method
    }
  }

  Future<void> saveBroadcast(Broadcast broadcast) async {
     if (_bearerToken == null) { updateState(_currentState.copyWith(notificationMessage: "Authentication required.", isNotificationSuccess: false)); return; } // Call public method

     try {
        Broadcast? result;
        String successMessage;
        if (broadcast.id == null) { // Adding new
           result = await client.broadcast.addBroadcast(broadcast, bearerToken: _bearerToken);
           successMessage = 'Broadcast berhasil dibuat';
        } else { // Updating existing
           result = await client.broadcast.updateBroadcast(broadcast, bearerToken: _bearerToken);
           successMessage = 'Broadcast berhasil diperbarui';
        }
        if (result == null) throw Exception("Server returned null on save/update.");

        await fetchBroadcasts(); // Refresh list
        updateState(_currentState.copyWith( // Call public method
             isAddOrEditMode: false,
             clearBroadcastToEdit: true,
             notificationMessage: successMessage,
             isNotificationSuccess: true
         ));
     } catch (e) {
        print('[BroadcastService] Error saving broadcast: $e');
        updateState(_currentState.copyWith(notificationMessage: "Gagal menyimpan: $e", isNotificationSuccess: false)); // Call public method
        // Keep form open by not changing isAddOrEditMode on error
     }
  }

   Future<void> deleteBroadcast() async {
      if (_currentState.broadcastToDelete == null || _bearerToken == null) return;
      int idToDelete = _currentState.broadcastToDelete!.id!;

      try {
          bool success = await client.broadcast.deleteBroadcast(idToDelete, bearerToken: _bearerToken);
          if (success) {
              await fetchBroadcasts(); // Refresh list
              updateState(_currentState.copyWith(clearBroadcastToDelete: true, notificationMessage: 'Broadcast berhasil dihapus', isNotificationSuccess: true));
          } else {
             updateState(_currentState.copyWith(clearBroadcastToDelete: true, notificationMessage: 'Gagal menghapus (tidak ditemukan)', isNotificationSuccess: false));
          }
      } catch (e) {
          print('[BroadcastService] Error deleting broadcast: $e');
          updateState(_currentState.copyWith(clearBroadcastToDelete: true, notificationMessage: "Gagal menghapus: $e", isNotificationSuccess: false));
      }
   }

  // --- UI Mode Changers ---
  void startAdd() {
      updateState(_currentState.copyWith(isAddOrEditMode: true, clearBroadcastToEdit: true, clearBroadcastToDelete: true));
  }

   void startEdit(Broadcast broadcast) {
      updateState(_currentState.copyWith(isAddOrEditMode: true, broadcastToEdit: broadcast, clearBroadcastToDelete: true));
   }

   void startDelete(Broadcast broadcast) {
       updateState(_currentState.copyWith(broadcastToDelete: broadcast, clearBroadcastToEdit: true, isAddOrEditMode: false));
   }

   void cancelFormOrDelete() {
       updateState(_currentState.copyWith(isAddOrEditMode: false, clearBroadcastToEdit: true, clearBroadcastToDelete: true));
   }

   // Call this from UI if needed, or use auto-clear timer
   void clearNotification() {
       updateState(_currentState.copyWith(clearNotification: true));
   }

   // --- Cleanup ---
   void dispose() {
      _stateController.close();
      print("[BroadcastService] Disposed.");
   }
}