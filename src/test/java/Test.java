import com.example.demo.UserService;

public class Test {
    public static void main(String[] args) {
        UserService.getAllUsers().forEach(user ->
                System.out.println(user.getId() + " - " + user.getUsername() + " - " + user.getEmail())
        );
    }
}
