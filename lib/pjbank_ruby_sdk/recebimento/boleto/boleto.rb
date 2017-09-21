class BoletoRecebimento

    def credenciamento dados

        response = HTTParty.post(
            "https://api.pjbank.com.br/recebimentos/",
            headers: {
                "Content-Type": "application/json"
            },
            body: {
                nome_empresa: "#{dados[:nome_empresa]}",
                conta_repasse: "#{dados[:conta_repasse]}",
                agencia_repasse: "#{dados[:agencia_repasse]}",
                banco_repasse: "#{dados[:banco_repasse]}",
                cnpj: "#{dados[:cnpj]}",  
                ddd: "#{dados[:ddd]}",  
                telefone: "#{dados[:telefone]}",  
                email: "#{dados[:email]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    def emitir dados, aut

        response = HTTParty.post(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial]}/transacoes",
            headers: {
                "Content-Type": "application/json"
            },
            body: {
                vencimento: "#{dados[:vencimento]}",
                valor: "#{dados[:valor]}",
                juros: "#{dados[:juros]}",
                multa: "#{dados[:multa]}",
                desconto: "#{dados[:desconto]}",
                nome_cliente: "#{dados[:nome_cliente]}",  
                cpf_cliente: "#{dados[:cpf_cliente]}",  
                endereco_cliente: "#{dados[:endereco_cliente]}",  
                numero_cliente: dados[:numero_cliente],  
                complemento_cliente: "#{dados[:complemento_cliente]}",  
                bairro_cliente: "#{dados[:bairro_cliente]}",  
                cidade_cliente: "#{dados[:cidade_cliente]}",  
                estado_cliente: "#{dados[:estado_cliente]}",  
                cep_cliente: "#{dados[:cep_cliente]}",  
                logo_url: "#{dados[:logo_url]}",  
                grupo: "#{dados[:grupo]}",
                pedido_numero: "#{dados[:pedido_numero]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    # TESTE - OK
    def impressaoLote dados, aut

        response = HTTParty.post(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial]}/transacoes/lotes",
            headers: {
                "x-chave": "#{aut[:chave]}",
                "Content-Type": "application/json"
            },
            body: {
                pedido_numero: dados[:pedido_numero],
                # formato: "#{formato}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end


    # TESTE - OK
    def impressaoCarne dados, aut

        response = HTTParty.delete(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial]}/transacoes/lotes",
            headers: {
                "x-chave": "#{aut[:chave]}",
                "Content-Type": "application/json"
            },
            body: {
                pedido_numero: dados[:pedido_numero],
                formato: "#{dados[:formato]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

end