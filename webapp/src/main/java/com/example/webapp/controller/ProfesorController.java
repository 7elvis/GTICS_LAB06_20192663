package com.example.webapp.controller;
        import com.example.webapp.entity.*;
        import com.example.webapp.repository.*;
        import java.time.LocalTime;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.web.bind.annotation.GetMapping;
        import org.springframework.web.bind.annotation.PostMapping;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestParam;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.format.annotation.DateTimeFormat;
        import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/profesor")
public class ProfesorController {

    @Autowired
    private PedidosPacienteRepository pedidoPacienteRepository;

    @GetMapping("/nuevopedido")
    public String Pedidos(Model model) {

        model.addAttribute("pedido", new PedidosPaciente());
        return "/profesor/nuevo_pedido";
    }



}