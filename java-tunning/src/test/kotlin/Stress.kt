import java.net.URI
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import java.util.concurrent.Executors

class Stress

fun main() {
    val service = Executors.newFixedThreadPool(8);

    for (i in 1..100) {
        service.submit {
            call(i)
        }
    }

    service.shutdown()
}

fun call(i: Int) {
    val init = LocalDateTime.now()
    val client= HttpClient.newHttpClient()

    val request = HttpRequest.newBuilder().uri(URI.create("http://localhost:31146/v1/test"))
        .method("GET", HttpRequest.BodyPublishers.noBody())
        .build()

    try {
        val resp = client.send(request, HttpResponse.BodyHandlers.ofString())
        println(
            "$i result ${
                init.until(
                    LocalDateTime.now(),
                    ChronoUnit.MILLIS
                )
            }"
        )
    } catch (error: Exception) {
        println(error)
    }
}