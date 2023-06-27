class FirestorePath {
  static String todo(String uid, String todoId) => 'users/$uid/todos/$todoId';
  static String todos(String uid) => 'users/$uid/todos';
}