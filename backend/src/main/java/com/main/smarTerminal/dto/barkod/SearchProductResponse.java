package com.main.smarTerminal.dto.barkod;

public record SearchProductResponse(String name,
                                    Double purchasePrice,
                                    Double salePrice,
                                    String group,
                                    Double amount,
                                    Integer monthlySale) {
}