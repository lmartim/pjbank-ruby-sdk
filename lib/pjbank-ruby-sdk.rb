require 'httparty'

require File.dirname(__FILE__) + '/pjbank_ruby_sdk'
require File.dirname(__FILE__) + '/pjbank_ruby_sdk/version'
require File.dirname(__FILE__) + '/pjbank_ruby_sdk/contadigital/contadigital'
require File.dirname(__FILE__) + '/pjbank_ruby_sdk/recebimento/recebimento'

module PJBank

    class Recebimento

        def self.boleto(params)
            controller = RecebimentoController::Boleto.new
            yield APICall::api_call(controller, params)
        end

        def self.cartao(params)
            controller = RecebimentoController::Cartao.new
            yield api_call(controller, params)
        end

        def self.extrato(params)
            controller = RecebimentoController::Extrato.new
            yield api_call(controller, params)
        end

    end

    class ContaDigital

        def self.credenciamento(params)
            controller = ContaDigitalController::Credenciamento.new
            yield APICall::api_call(controller, params)
        end

        def self.consultas(params)
            controller = ContaDigitalController::Consultas.new
            yield APICall::api_call(controller, params)
        end

        def self.transacoes(params)
            controller = ContaDigitalController::Transacoes.new
            yield APICall::api_call(controller, params)
        end

        def subcontas(params)
            controller = ContaDigitalController::Subcontas.new
            yield APICall::api_call(controller, params)
        end

        def recebimentos(params)
            controller = ContaDigitalController::Recebimentos.new
            yield APICall::api_call(controller, params)
        end
        
    end
    
end

class APICall
    include PJBank

    def self.api_call(controller, params)
        return response = controller.public_send(params[:acao], params)
    end
end
