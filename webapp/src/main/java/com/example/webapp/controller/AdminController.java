package com.example.webapp.controller;
import com.example.webapp.entity.*;
import com.example.webapp.repository.*;
import javax.servlet.http.Part;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    InevntarioRepository inventarioRepository;
    @GetMapping("")
    public String listaDispositivos(Model model) {
        model.addAttribute("listaEmployee", employeesRepository.findAll());

        return "/admin/Plantilla";
    }

}

