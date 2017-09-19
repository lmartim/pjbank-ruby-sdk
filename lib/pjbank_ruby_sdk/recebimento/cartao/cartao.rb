class CartaoRecebimento

    def credenciamento dados
        response = HTTParty.post(
            'https://api.pjbank.com.br/recebimentos/',
            headers: {
                "Content-Type": "Application/json"
            },
           body: {
                nome_empresa: "#{dados[:nome_empresa]}",
                conta_repasse: "#{dados[:conta_repasse]}",
                agencia_repasse: "#{dados[:agencia_repasse]}",
                banco_repasse: "#{dados[:banco_repasse]}",
                cnpj: "#{dados[:cnpj]}",  
                ddd: "#{dados[:ddd]}",  
                telefone: "#{dados[:telefone]}",  
                email: "#{dados[:email]}",
                cartao: "#{dados[:cartao]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

    def tokenizar dados, aut
        response = HTTParty.post(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/tokens",
            headers: { 
                "x-chave": "#{aut[:chave_cartao]}",
                "Content-Type": "Application/json"
            },
           body: {
                nome_cartao: "#{dados[:nome_cartao]}",
                numero_cartao: "#{dados[:numero_cartao]}",
                mes_vencimento: "#{dados[:mes_vencimento]}",
                ano_vencimento: "#{dados[:ano_vencimento]}",
                cpf_cartao: "#{dados[:cpf_cartao]}",
                email_cartao: "#{dados[:email_cartao]}",
                celular_cartao: "#{dados[:celular_cartao]}",
                codigo_cvv: "#{dados[:codigo_ccv]}",
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

    def emitirToken dados, aut
        response = HTTParty.post(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/transacoes",
            headers: { 
                "x-chave": "#{aut[:chave_cartao]}",
                "Content-Type": "Application/json"
            },
           body: {
                token_cartao: "#{dados[:token_cartao]}",
                valor: "#{dados[:valor]}",
                parcelas: "#{dados[:parcelas]}",
                descricao_pagamento: "#{dados[:descricao_pagamento]}",
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

    def emitirCartao dados, aut
        response = HTTParty.post(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/transacoes",
            headers: { 
                "x-chave": "#{aut[:chave_cartao]}",
                "Content-Type": "Application/json"
            },
           body: {
                numero_cartao: "#{dados[:numero_cartao]}",
                nome_cartao: "#{dados[:nome_cartao]}",
                mes_vencimento: "#{dados[:mes_vencimento]}",
                ano_vencimento: "#{dados[:ano_vencimento]}",
                cpf_cartao: "#{dados[:cpf_cartao]}",
                email_cartao: "#{dados[:email_cartao]}",
                celular_cartao: "#{dados[:celular_cartao]}",
                codigo_ccv: "#{dados[:codigo_ccv]}",
                valor: "#{dados[:valor]}",
                parcelas: "#{dados[:parcelas]}",
                descricao_pagamento: "#{dados[:descricao_pagamento]}",
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

    def cancelarTransacao aut
        response = HTTParty.post(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/transacoes/#{aut[:tid_cartao]}",
            headers: { 
                "x-chave": "#{aut[:chave_cartao]}",
                "Content-Type": "Application/json"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

end