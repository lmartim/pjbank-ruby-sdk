require 'rest-client'
require 'httparty'

require File.dirname(__FILE__) + '/pjbank_ruby_sdk'
require File.dirname(__FILE__) + '/pjbank_ruby_sdk/version'
require File.dirname(__FILE__) + '/pjbank_ruby_sdk/contadigital/contadigital'
require File.dirname(__FILE__) + '/pjbank_ruby_sdk/recebimento/recebimento'

module PJBank
    class Recebimento
        
        def self.boleto(params)
            recebimentoController = RecebimentoController::Boleto.new
            response = recebimentoController.public_send(params[:acao], params)
            yield response
        end

        def self.cartao(params)
            recebimentoController = RecebimentoController::Cartao.new
            response = recebimentoController.public_send(params[:acao], params) 
            yield response
        end

        def self.extrato(params)
            recebimentoController = RecebimentoController::Extrato.new
            response = recebimentoController.public_send(params[:acao], params)
            yield response
        end

    end

    class ContaDigital

        @@contaController = ContaDigitalController.new
        
    end
end
