package com.main.smarTerminal.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;
import java.util.UUID;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Barkod {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BarkodID", nullable = false, precision = 18)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "FirmaID")
    private Organization firmaID;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "StokTipID")
    private StokTip stokTipID;

    @Nationalized
    @Column(name = "Kod", nullable = false, length = 50)
    private String kod;

    @Nationalized
    @Column(name = "BarkodNo", length = 50)
    private String barkodNo;

    @Column(name = "YaratanKullaniciID")
    private UUID yaratanKullaniciID;

    @Column(name = "YaratilmaTarih")
    private Instant yaratilmaTarih;

    @Column(name = "Sil")
    private Boolean sil;

    @JoinColumn(name = "StokKartID")
    @ManyToOne(fetch = FetchType.EAGER)
    private StokKart stokKart;

}