class Conta
	#deveria conseguir criar um objeto do tipo Conta
	def initialize(data = {numero: numero, titular: titular, saldo: saldo, limite: limite})
		@numero = data[:numero]
		@titular = Cliente.new(data[:titular])
		@saldo = data[:saldo]
		@limite = data[:limite]
	end
	#--getters--
	def numero
		@numero
	end
	def titular
		@titular
	end
	def saldo
		@saldo
	end
	def limite
		@limite
	end

	#deveria ter um novo saldo quando houver um saque
	#deveria deixar a conta negativa quando o saque usar o limite
	def sacar(saque)
		#deveria retornar false quando não for possível sacar
		if saque > (@saldo + @limite)
			false
		else
			@saldo -= saque
		end
	end

	#deveria ter um novo saldo depois de um deposito
	def depositar(deposito)
		@saldo += deposito
	end

	#deveria mostrar que a conta está usando limite
	def no_limite?
		if @saldo < @limite
			true
		end
	end

	#duas contas com mesmos dados deveriam ser iguais
	attr_reader :number
	def ==(conta)
		@number == conta.number
	end

	#deveria ter novo saldo após tranferencia
	def transfere(conta, valor)
		#deveria ser false quando não for possivel transferir
		if(sacar(valor))
			conta.depositar(valor)
		else
			false
		end
	end
end

#titular deveria ser um Cliente
class Cliente
	def initialize(titular)
		@titular = titular
	end
	def getTitular
		@titular
	end
end

