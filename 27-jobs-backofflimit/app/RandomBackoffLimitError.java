import java.util.Random;

public class RandomBackoffLimitError {

    public static void main(String[] args) {
        Random r = new Random();

        int n = r.nextInt(6);
        if (n < 5) {
            throw new RuntimeException("Random error!");
        } 
        System.out.println("OK");
    }

}