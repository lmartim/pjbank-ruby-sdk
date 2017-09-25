class ConsultasContaDigital
    
    def cadastro dados, aut
        response = HTTParty.get(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            body: {
                com_saldo: "#{dados[:com_saldo]}",
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)

        return retorno
    end

    def documentos aut

        response = HTTParty.get(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/documentos",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)

        return retorno   

    end

    def socio dados, aut

        response = HTTParty.get(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/administradores/#{dados[:email]}",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)

        return retorno         

    end

    def administradores aut

        response = HTTParty.get(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/administradores",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            :verify => false,
        )

        # retorno = JSON.parse(response.body)

        return response  

    end

end