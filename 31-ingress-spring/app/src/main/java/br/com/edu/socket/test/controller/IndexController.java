/* Spring app (C)2023 */
package br.com.edu.socket.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

  @RequestMapping({"/", "index", "index.html"})
  public String index(Model model) {
    var podUrl = System.getenv("POD_URL");
    if (podUrl == null || podUrl.isBlank()) {
      podUrl = "http://localhost:8080";
    }
    model.addAttribute("podUrl", podUrl);
    model.addAttribute("serverName", System.getenv("SERVER_NAME"));
    return "index";
  }
}
