require_relative 'pjbank-ruby-sdk'

# puts "Testes: "
# puts "1 - Recebimento/Boleto/Credenciamento"
# puts "2 - Recebimento/Boleto/Emitir"
# puts "3 - Recebimento/Boleto/Impressão em Lotes"
# puts "4 - Recebimento/Boleto/Impressão de Carnê"
# puts "5 - Recebimento/Cartão de Crédito/Credenciamento"
# puts "6 - Recebimento/Cartão de Crédito/Tokenizar um cartão"
# puts "7 - Recebimento/Cartão de Crédito/Criar transação com token"
# puts "8 - Recebimento/Cartão de Crédito/Criar transação com dados do cartão"
# puts "9 - Recebimento/Cartão de Crédito/Cancelar transação"
# puts "10 - Recebimento/Extrato/Extrato de pagamentos"
# puts "11 - Recebimento/Extrato/Extrato de pagamentos liquidados"
# puts "12 - Recebimento/Extrato/Extrato de pagamentos filtrados por data"
# puts "13 - Recebimento/Extrato/Extrato de pagamentos paginado"

puts "Lendo:"
teste = gets.chomp

case teste
    # OK    
    when '1'
        PJBank::ContaDigital.subcontas(
            acao: "criar", 
            dados: {
                data_nascimento: "08/08/2017",
                sexo: "M",
                tipo: "cartao_corporativo",
                valor: "7.50",
                cnpj: "24351345000158",
                nome_cartao: "Cliente de Teste",
                cep: "13301510",
                endereco: "Rua Joaquim Vilac",
                numero: "501",
                bairro: "Vila Teixeira",  
                complemento: "",  
                cidade: "Campinas",
                estado: "SP",
                ddd: "19",
                telefone: "40096830",
                email: "api@pjbank.com.br"
            }
        ){|response|
            puts response
            case response["status"]
            when 200, 201
                puts response["credencial"]
                puts response["chave"]
            else
                puts response["msg"]
            end
        }
    # NOT OK
    when '2'
        PJBank::ContaDigital.subcontas(
            acao: "consultar", 
            aut: {
                credencial: '1c12c151b07a56dfefa477f52ba494bf54e1cdc2',
                chave: '8573f0712694e804a33822b084baffa04c4c44b0'
            },
            dados: {
                arquivo: '',
                tipo: 'contratosocial'
            }
        ){|response|
            puts response
            case response["status"]
            when 200, 201
                puts response["msg"]
                puts response["linkBoleto"]
            else
                puts response["msg"]
            end
        }
    # OK
    when '3'
        PJBank::ContaDigital.subcontas(
            acao: "adicionar",
            aut: {
                credencial: '1c12c151b07a56dfefa477f52ba494bf54e1cdc2',
                chave: '8573f0712694e804a33822b084baffa04c4c44b0'
            },
            dados: {
                valor: "900.00",
            }
        ){|response|
            case response["status"]
            when 200, 201
                puts response
            else
                puts response["msg"]
            end
        }
    # OK
    when '4'
        PJBank::ContaDigital.subcontas(
            acao: "extrato", 
            aut: {
                credencial: '1c12c151b07a56dfefa477f52ba494bf54e1cdc2',
                chave: '8573f0712694e804a33822b084baffa04c4c44b0'
            },
            dados: {
                webhook: 'http://example.com'
            }
        ){|response|
            case response["status"]
            when 200, 201
                puts response
            else
                puts response["msg"]
            end
        }
end