class ExtratoRecebimento
    def pagamentos aut
        response = HTTParty.get(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/transacoes",
            headers: {
                "x-chave": "#{aut[:chave_cartao]}",
                "Content-Type": "Application/json"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

    def pagamentosLiquidados aut
        response = HTTParty.get(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/transacoes?pago=1",
            headers: {
                "x-chave": "#{aut[:chave_cartao]}",
                "Content-Type": "Application/json"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

    def pagamentosFiltrados aut
        response = HTTParty.get(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/transacoes?data_inicio=#{aut[:data_inicio]}&data_fim=#{aut[:data_fim]}",
            headers: {
                "x-chave": "#{aut[:chave_cartao]}",
                "Content-Type": "Application/json"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno
    end

    def pagamentosPaginados aut
        response = HTTParty.get(
            "https://api.pjbank.com.br/recebimentos/#{aut[:credencial_cartao]}/transacoes?pagina=#{aut[:pagina]}",
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