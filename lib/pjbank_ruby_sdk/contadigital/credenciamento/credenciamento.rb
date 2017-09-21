class CredenciamentoContaDigital

    def credenciamento dados
        
        response = HTTParty.post(
            "https://api.pjbank.com.br/contadigital/",
            headers: {
                "Content-Type": "application/json"
            },
            body: {
                nome_empresa: "#{dados[:nome_empresa]}",
                cnpj: "#{dados[:cnpj]}",
                cep: "#{dados[:cep]}",
                endereco: "#{dados[:endereco]}",
                numero: "#{dados[:numero]}",  
                bairro: "#{dados[:bairro]}",  
                complemento: "#{dados[:complemento]}",  
                cidade: "#{dados[:cidade]}",
                estado: "#{dados[:estado]}",
                ddd: "#{dados[:ddd]}",
                telefone: "#{dados[:telefone]}",
                email: "#{dados[:email]}",
                webhook: "#{dados[:webhook]}",
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)

        if(!retorno["status"]) 
            retorno.push("status", 200)
        end

        return retorno

    end

    def inserir dados, aut

        response = HTTParty.post(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/documentos",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            body: {
                arquivos: "#{dados[:arquivos]}",
                tipo: "#{dados[:tipo]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    def adicionar dados, aut
        
        response = HTTParty.post(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            body: {
                valor: "#{dados[:valor]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    def webhook dados, aut
        
        response = HTTParty.put(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            body: {
                webhook: "#{dados[:webhook]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    def convidar dados, aut
        
        response = HTTParty.post(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/administradores",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            body: {
                email: "#{dados[:email]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    def remover dados, aut
        
        response = HTTParty.delete(
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


end