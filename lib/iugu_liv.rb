require "iugu_liv/version"
require "typhoeus"
require "json"

module IuguLiv
  def gerar_token user
    fields = {
      :account_id => "",
      :method => "credit_card",
      :test => true,
      :data => {
        :number => "4111111111111111",
        :verification_value => "1231",
        :first_name => user.first_name,
        :last_name => user.last_name,
        :month => "10",
        :year => "2020"
      }
    }

    url = "https://api.iugu.com/v1/payment_token"

    request = Typhoeus::Request.new(
      url,
      method: "post",
      body: fields
    )
    request.run
    response = request.response
    response.code
    return JSON.parse(response.body)
  end

  def criar_usuario
    customer = {
      :api_token => "",
      :email => user.email,
      :name => "#{user.first_name} #{user.last_name}"
    }

    url = "https://api.iugu.com/v1/customers"

    request = Typhoeus::Request.new(
      url,
      method: "post",
      body: customer
    )

    request.run
    response = request.response
    puts response.code
    return JSON.parse(response.body)
  end

  def alterar_usuario
  end

  def criar_forma_pagamento
    payment_method = {
      :api_token => "",
      :customer_id => user.customer_id,
      :description => "Método de pagamento LIVIMA",
      :token => token,
      :set_as_default => true
    }

    url = "https://api.iugu.com/v1/customers/#{user.customer_id}/payment_methods"

    request = Typhoeus::Request.new(
      url,
      method: "post",
      body: payment_method
    )
    request.run
    response = request.response
    puts response.code
    return JSON.parse(response.body)
  end

  def alterar_forma_pagamento
  end

  def criar_assinatura
    subscription = {
      :api_token => "",
      :plan_identifier => plan_identifier,
      :customer_id => user.customer_id,
      :only_on_charge_success => true,
      :set_as_default => true
    }

    url = "https://api.iugu.com/v1/subscriptions"

    request = Typhoeus::Request.new(
      url,
      method: "post",
      body: subscription
    )
    request.run
    response = request.response
    puts response.code
    return JSON.parse(response.body)
  end

  def alterar_assinatura
  end

  def cancelar_assinatura
    url = "https://api.iugu.com/v1/subscriptions/#{subscription.subscription_id}"

    request = Typhoeus::Request.new(
      url,
      method: "delete"
    )
    request.run
    response = request.response
    puts response.code
    return JSON.parse(response.body)
  end
end
