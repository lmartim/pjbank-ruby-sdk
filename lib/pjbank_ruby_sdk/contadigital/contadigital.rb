require_relative 'credenciamento/credenciamento'
require_relative 'consultas/consultas'
# require_relative 'transacoes/transacoes'
require_relative 'subcontas/subcontas'
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

    class Consultas
        def initialize
            @consultasController = ConsultasContaDigital.new
        end

        def cadastro params
            if !params[:dados]
                dados = {com_saldo: "false"}
            else
                dados = params[:dados]
            end
            aut = params[:aut]
            
            @consultasController.cadastro dados, aut
        end

        def documentos params
            aut = params[:aut]
            @consultasController.documentos aut
        end

        def socio params
            dados = params[:dados]
            aut = params[:aut]
            @consultasController.socio dados, aut
        end

        def administradores params
            aut = params[:aut]
            @consultasController.administradores aut
        end

    end

    class Subcontas
        def initialize
            @subcontasController = SubcontasContaDigital.new
        end

        def criar params
            dados = params[:dados]
            aut = params[:aut]
            @subcontasController.criar dados, aut
        end

        def consultar params
            dados = params[:dados]
            aut = params[:aut]
            @subcontasController.consultar dados, aut
        end

        def adicionar params
            dados = params[:dados]
            aut = params[:aut]
            @subcontasController.adicionar dados, aut
        end

        def extrato params
            dados = params[:dados]
            aut = params[:aut]
            @subcontasController.extrato dados, aut
        end

    end

end