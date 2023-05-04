/* Spring app (C)2023 */
package br.com.edu.socket.test.controller;

import br.com.edu.socket.test.controller.dto.ResponseDTO;
import java.io.IOException;
import java.net.*;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@Slf4j
@RestController("/")
public class TestController {

  @GetMapping(value = "/ok", produces = "application/json")
  public ResponseEntity<ResponseDTO> ok() {
    return ResponseEntity.ok().body(new ResponseDTO(System.getenv("SERVER_NAME")));
  }

  @GetMapping(value = "/test", produces = "application/json")
  public ResponseEntity<ResponseDTO> test(
      @RequestParam(required = true) String host, @RequestParam(required = true) Integer port)
      throws IOException {

    try {
      log.debug("Iniciando o teste: " + host + ":" + port);
      HttpClient httpClient = HttpClient.newHttpClient();
      HttpRequest httpRequest =
          HttpRequest.newBuilder()
              .uri(URI.create("http://" + host + ":" + port + "/ok"))
              .GET()
              .build();

      HttpResponse<String> httpResponse =
          httpClient.send(httpRequest, HttpResponse.BodyHandlers.ofString());

      String responseBody = httpResponse.body();

      return ResponseEntity.ok().body(new ResponseDTO(System.getenv("SERVER_NAME")));
    } catch (Exception e) {
      e.printStackTrace();
      log.error(e.getMessage());
      throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage(), e);
    }
  }
}
