// SRP를 위반하는 예시
class User {
  String name;
  String email;

  User(this.name, this.email);

  void saveUser() {
    // 데이터베이스에 사용자 저장 로직
  }

  void sendEmail() {
    // 이메일 전송 로직
  }

  String generateReport() {
    // 사용자 보고서 생성 로직
    return "User Report";
  }
}