import java.util.Random;

public class RandomError {

    public static void main(String[] args) {
        Random r = new Random();

        if (r.nextBoolean()) {
            throw new RuntimeException("Random error!");
        } 
        System.out.println("OK");
    }

}