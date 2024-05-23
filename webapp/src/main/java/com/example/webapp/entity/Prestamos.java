package com.example.webapp.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="`prestamos`")
public class Prestamos {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_prestamo")
    private int id;
    @Column(nullable = false)
    private String estudiante;
    private String dispositivo;
    private String fecha_inicio;
    private String fecha_fin;


}
