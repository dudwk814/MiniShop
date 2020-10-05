package controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/")
@Log4j
public class BaordController {

    @GetMapping("/list")
    public String list() {

        log.info("Board List Page");

        return "board/list";
    }
}
