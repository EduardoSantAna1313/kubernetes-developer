import java.nio.file.*;

public class TestResource {
    public static void main(String[] args) throws Exception {
        createFile();

        readLines();
    }

    private static void createFile() throws Exception {
        Files.write(Path.of("out.txt"), "A\n".repeat(25*1024*1024).getBytes(), StandardOpenOption.CREATE);
    }

    private static void readLines() throws Exception {
        long count = Files.readAllLines(Path.of("out.txt")).stream().count();
        System.out.println("Count: " + count);
    }
}