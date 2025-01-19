package com.main.smarTerminal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

@Getter
@Setter
@Entity
public class DepoKart {
    @Id
    @Column(name = "DepoKartID", nullable = false)
    private Integer id;

    @Column(name = "Kod", nullable = false, length = 30)
    private String kod;

    @Column(name = "Ad", length = 50)
    private String ad;

    @Column(name = "Durum")
    private Integer durum;

    @ColumnDefault("0")
    @Column(name = "Sil")
    private Boolean sil;

    @ColumnDefault("0")
    @Column(name = "DataDurum")
    private Boolean dataDurum;

    @Column(name = "YazarkasaNo")
    private Integer yazarkasaNo;

}