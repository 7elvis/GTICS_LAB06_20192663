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
@RequestMapping("/farmacista")
public class FarmacistaController {

    @Autowired
    private PedidosPacienteRepository pedidoPacienteRepository;

    @GetMapping("/nuevopedido")
    public String Pedidos(Model model) {

        model.addAttribute("pedido", new PedidosPaciente());
        return "/farmacista/nuevo_pedido";
    }

    @PostMapping("/pedidoconreceta/guardar")
    public String GuardarPedidoConReceta(Model model,
            @RequestParam(name = "hora_de_entrega")
            @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime horaDeEntrega,
            PedidosPaciente obj, RedirectAttributes attributes) {
        try {
            obj.setTipo_de_pedido("CON RECETA");
            obj.setHora_de_entrega(horaDeEntrega);
            obj = pedidoPacienteRepository.save(obj);

            if (obj.getId() > 0) {
                attributes.addFlashAttribute("success", "Pedido con receta registrado!");
                return "redirect:/farmacista/nuevopedido";
            }

            model.addAttribute("error", "No se pudo guardar pedido");
        } catch (Exception ex) {
            model.addAttribute("error", ex.getMessage());
        }
        model.addAttribute("pedido", obj);
        return "/farmacista/nuevo_pedido";
    }

    @PostMapping("/pedidosinreceta/guardar")
    public String GuardarPedidoSinReceta(Model model,
            PedidosPaciente obj, RedirectAttributes attributes) {
        try {
            obj.setTipo_de_pedido("SIN RECETA");
            obj = pedidoPacienteRepository.save(obj);

            if (obj.getId() > 0) {
                attributes.addFlashAttribute("success", "Pedido sin receta registrado!");
                return "redirect:/farmacista/nuevopedido";
            }

            model.addAttribute("error", "No se pudo guardar pedido");
        } catch (Exception ex) {
            model.addAttribute("error", ex.getMessage());
        }
        model.addAttribute("pedido", obj);
        return "/farmacista/nuevo_pedido";
    }

}
