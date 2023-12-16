package br.com.edu.kyverno.api.v1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/pessoas")
public class PessoaController {


    @GetMapping
    public List<PessoaResponse> list() {
        return List.of();
    }


    record PessoaResponse(UUID id, String nome) {

    }

}
