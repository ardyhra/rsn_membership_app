// import 'package:serverpod/serverpod.dart';
// import 'package:serverpod_auth_server/serverpod_auth_server.dart';
// import '../generated/protocol.dart'; // Pastikan path ini benar
// import '../generated/akun.dart';

// class AuthMiddleware extends EndpointMiddleware {
//   @override
//   Future<bool> handleCall(InvocationContext context, NextCallback next) async {
//     final token = context.headers['authorization']?.split(' ').last;

//     if (token != null) {
//       final auth = ServerpodAuth();
//       final sessionInfo = await auth.validateSession(context.session, token);

//       if (sessionInfo != null) {
//         context.session.setUserInfo('userId', sessionInfo.userId);
//         context.session.setUserInfo('userName', sessionInfo.userName);
//         // Anda mungkin ingin mengambil informasi peran dari tabel Akun berdasarkan userId
//         final akun = await Akun.db.findById(context.session, int.parse(sessionInfo.userId));
//         if (akun != null) {
//           context.session.setUserInfo('role', akun.role);
//         }
//         return await next(context); // Token valid, lanjutkan
//       }
//     }

//     // Token tidak valid atau tidak ada
//     throw ServerpodException(StatusCode.unauthenticated, 'Unauthorized');
//   }
// }