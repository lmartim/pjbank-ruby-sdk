require_relative 'credenciamento/credenciamento'
# require_relative 'consultas/consultas'
# require_relative 'transacoes/transacoes'
# require_relative 'subcontas/subcontas'
# require_relative 'recebimentos/recebimentos'

class ContaDigitalController

    class Credenciamento
        def initialize
            @credenciamentoController = CredenciamentoContaDigital.new
        end

        def credenciamento params
            dados = params[:dados]
            @credenciamentoController.credenciamento dados
        end

        def inserir params
            dados = params[:dados]
            aut = params[:aut]
            @credenciamentoController.inserir dados, aut
        end

        def adicionar params
            dados = params[:dados]
            aut = params[:aut]
            @credenciamentoController.adicionar dados, aut
        end

        def webhook params
            dados = params[:dados]
            aut = params[:aut]
            @credenciamentoController.webhook dados, aut
        end

        def convidar params
            dados = params[:dados]
            aut = params[:aut]
            @credenciamentoController.convidar dados, aut
        end

        def remover params
            dados = params[:dados]
            aut = params[:aut]
            @credenciamentoController.remover dados, aut
        end

    end

end