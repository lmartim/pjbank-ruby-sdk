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
        PJBank::ContaDigital.credenciamento(
            acao: "credenciamento", 
            dados: {
                nome_empresa: "Exemplo Conta Digital",
                cnpj: "40426207000147",
                cep: "13032525",
                endereco: "Rua Joaquim Vilac",
                numero: "509",
                bairro: "Vila Teixeira",
                complemento: "",
                cidade: "Campinas",
                estado: "SP",
                ddd: "19",  
                telefone: "987652345",  
                email: "api@pjbank.com.br",
                webhook: "http://example.com.br"
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
        PJBank::ContaDigital.credenciamento(
            acao: "inserir", 
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
        PJBank::ContaDigital.credenciamento(
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
        PJBank::ContaDigital.credenciamento(
            acao: "webhook", 
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
    # OK
    when '5'
        PJBank::ContaDigital.credenciamento(
            acao: "convidar",
            aut: {
                credencial: '1c12c151b07a56dfefa477f52ba494bf54e1cdc2',
                chave: '8573f0712694e804a33822b084baffa04c4c44b0'
            },
            dados: {
                email: "api@pjbank.com.br",
            }
        ){|response|
            puts response
            case response["status"]
            when 200, 201
                puts response["msg"]
            else
                puts response["msg"]
            end
        }
    # OK
    when '6'
        PJBank::ContaDigital.credenciamento(
            acao: "remover",
            aut: {
                credencial: '1c12c151b07a56dfefa477f52ba494bf54e1cdc2',
                chave: '8573f0712694e804a33822b084baffa04c4c44b0'
            },
            dados: {
                email: "api@pjbank.com.br",
            }
        ){|response|
            puts response
            case response["status"]
            when 200, 201
                puts response["msg"]
            else
                puts response["msg"]
            end
        }
    # NOT OK
    when '7'
        PJBank::ContaDigital.consultas(
            acao: "cadastro",
            aut: {
                credencial: 'eb2af021c5e2448c343965a7a80d7d090eb64164',
                chave: 'a834d47e283dd12f50a1b3a771603ae9dfd5a32c'
            },
            dados: {
                com_saldo: true,
            }
        ){|response|
            puts response
            case response["status"]
            when 200, 201
                puts response["msg"]
            else
                puts response["msg"]
            end
        }
    # OK
    when '8'
        PJBank::ContaDigital.consultas(
            acao: "documentos",
            aut: {
                credencial: 'eb2af021c5e2448c343965a7a80d7d090eb64164',
                chave: 'a834d47e283dd12f50a1b3a771603ae9dfd5a32c'
            }
        ){|response|
            puts response
        }
    # OK
    when '9'
        PJBank::ContaDigital.consultas(
            acao: "socio",
            aut: {
                credencial: 'eb2af021c5e2448c343965a7a80d7d090eb64164',
                chave: 'a834d47e283dd12f50a1b3a771603ae9dfd5a32c'
            },
            dados: {
                email: "api@pjbank.com.br",
            }
        ){|response|
            case response["status"]
            when 200, 201
                puts response["msg"]
            else
                puts response["msg"]
            end
        }
    # NOT OK
    when '10'
        PJBank::ContaDigital.consultas(
            acao: "administradores",
            aut: {
                credencial: 'eb2af021c5e2448c343965a7a80d7d090eb64164',
                chave: 'a834d47e283dd12f50a1b3a771603ae9dfd5a32c'
            }
        ){|response|
            puts response
            # case response["status"]
            # when 200, 201
            #     puts response["msg"]
            # else
            #     puts response["msg"]
            # end
        }
    when '11'
        PJBank::Recebimento.extrato(
            acao: :pagamentosLiquidados,
            aut: {
                'credencial_cartao': '1264e7bea04bb1c24b07ace759f64a1bd65c8560',
                'chave_cartao': 'ef947cf5867488f744b82744dd3a8fc4852e529f',
            }
        ){|response|
            case response["status"]
            when 200, 201
                puts response["msg"]
            else
                puts response["msg"]
            end
        }
    when '12'
        PJBank::Recebimento.extrato(
            acao: :pagamentosFiltrados,
            aut: {
                'credencial_cartao': '1264e7bea04bb1c24b07ace759f64a1bd65c8560',
                'chave_cartao': 'ef947cf5867488f744b82744dd3a8fc4852e529f',
                'data_inicio': '08/01/2017',
                'data_fim': '08/30/2017'
            }
        ){|response|
            case response["status"]
            when 200, 201
                puts response["msg"]
            else
                puts response["msg"]
            end
        }
    when '13'
        PJBank::Recebimento.extrato(
            acao: :pagamentosPaginados,
            aut: {
                'credencial_cartao': '1264e7bea04bb1c24b07ace759f64a1bd65c8560',
                'chave_cartao': 'ef947cf5867488f744b82744dd3a8fc4852e529f',
                'pagina': '3'
            }
        ){|response|
            case response["status"]
            when 200, 201
                puts response["msg"]
            else
                puts response["msg"]
            end
        }
end