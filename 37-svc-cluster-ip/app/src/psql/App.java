package psql;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class App {
    public static void main(String[] args) throws Exception {

        String url = System.getenv("POSTGRES_URL");

        String user = System.getenv("POSTGRES_USER");
        System.out.println("POSTGRES_USER: '" + user + "'");

        String password = System.getenv("POSTGRES_PASSWORD");

        String timeout = System.getenv("TIMEOUT");

        String runs = System.getenv("RUNS");

        Class.forName("org.postgresql.Driver");
        System.out.println("Connecting to psql...");

        try (Connection conn = DriverManager.getConnection(url, user, password);) {

            System.out.println("Connected!!!");

            for (int i = 0; i < Integer.valueOf(runs); i++) {
                System.out
                        .println("### " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss")) + " ###");

                try (var pstmt = conn.prepareStatement("select * from usuarios;");) {
                    var rs = pstmt.executeQuery();
                    while (rs.next()) {
                        System.out.println("Nome: " + rs.getString("Nome"));
                    }
                } catch (Exception error) {
                    error.printStackTrace();
                    throw new RuntimeException(error.getMessage());
                }

                Thread.sleep(Integer.valueOf(timeout));
            }

            System.exit(0);
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        }
    }
}