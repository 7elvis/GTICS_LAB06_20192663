package com.example.webapp.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="`inventario`")
public class Inevntario {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_inventario")
    private int id;
    @Column(nullable = false)
    private String nombre;
    private String cantidad;
    private String disponible;


}
