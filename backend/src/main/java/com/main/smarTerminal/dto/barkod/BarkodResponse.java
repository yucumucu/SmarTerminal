package com.main.smarTerminal.dto.barkod;

public record BarkodResponse(String name,
                             Double purchasePrice,
                             Double salePrice,
                             String group,
                             Double amount) {
}
/*
{
        "productName": "",
        "purchasePrice": 0.0,
        "salePrice": 0.0,
        "group": "",
        "amount": 0,
        "monthlySale":0
        }*/
