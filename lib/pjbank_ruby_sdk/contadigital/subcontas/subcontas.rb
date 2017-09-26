class SubcontasContaDigital

    def criar dados, aut
        
        response = HTTParty.post(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/subcontas",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            },
            body: {
                data_nascimento: "#{dados[:data_nascimento]}",
                sexo: "#{dados[:sexo]}",
                tipo: "#{dados[:tipo]}",
                valor: "#{dados[:valor]}",
                cnpj: "#{dados[:cnpj]}",  
                nome_cartao: "#{dados[:nome_cartao]}",  
                cep: "#{dados[:cep]}",  
                endereco: "#{dados[:endereco]}",
                numero: "#{dados[:numero]}",
                bairro: "#{dados[:bairro]}",
                complemento: "#{dados[:complemento]}",
                cidade: "#{dados[:cidade]}",
                estado: "#{dados[:estado]}",
                ddd: "#{dados[:ddd]}",
                telefone: "#{dados[:telefone]}",
                email: "#{dados[:estado]}"
            },
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    def consultar dados, aut

        response = HTTParty.get(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/subcontas/#{{dados[:subconta]}}",
            headers: {
                "Content-Type": "multipart/form-data",
                "x-chave-conta": "#{aut[:chave]}"
            }
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        return retorno

    end

    def adicionar dados, aut
        
        response = HTTParty.post(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/subcontas/#{{dados[:subconta]}}",
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

    def extrato dados, aut

        first = true;
        params = "";

        dados.each do |key, data|
            if first
                params = "?#{{key}}=#{{data}}"
                first = false;
            else
                params = params + "&#{{key}}=#{{data}}"
            end
        end
        
        response = HTTParty.get(
            "https://api.pjbank.com.br/contadigital/#{aut[:credencial]}/subcontas/#{{dados[:subconta]}}/transacoes#{{params}}",
            headers: {
                "Content-Type": "application/json",
                "x-chave-conta": "#{aut[:chave]}"
            }
            :verify => false,
        )

        retorno = JSON.parse(response.body)
        if(!retorno["status"]) 
            retorno["status"] = 201;
        end
        return retorno

    end

end