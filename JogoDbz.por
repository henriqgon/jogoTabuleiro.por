programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{

		// Variáveis usadas 
		
		inteiro iniciar = 1, personagem, sorteio
		inteiro jg1Pos = 1, jg2Pos = 1, vitoria1 = 0, vitoria2 = 0
		inteiro dado, dadoAdicional, vez
		inteiro temp, turno, opcao
		caracter personagem1, personagem2

		//Menu inicial do game

		enquanto (iniciar == 1){

			escreva("\n Ola, bem vindo ao nosso jogo de tabuleiro")
			escreva("\n Escolha o que deseja fazer: \n 1- JOGAR / 2- VERIFICAR PLACAR / 3- SAIR \n")
			leia(iniciar)

				// Verificação de valor válido
				
				enquanto(iniciar < 1 ou iniciar > 3){
					escreva("Digite uma opção válida: ")
					leia(iniciar)
				}
				
			se(iniciar == 1){

			//Explicação do jogo e escolha de personagem 
			
				escreva("Parabéns, vamos iniciar o nosso jogo")
				escreva("\n Nosso jogo se baseia numa corrida de tablueiro com 20 casas,  entre dois clássicos personagens, onde o que chegar primeiro na última casa, se provou mais forte.")
				escreva("\n Para decidir quem irá escolher o personagem primeiro, será feito um sorteio entre  1 e 2.")
				escreva("\n O número que sair corresponde ao jogador que irá escolher primeiro o personagem. ")
				sorteio = u.sorteia(1, 2)
				escreva("\n O número sorteado foi: ", sorteio)

				// Verificação do número sorteado/ De quem vai jogar primeiro 
				
				se(sorteio == 1){
					escreva("\n O jogador 1 escolhe primeiro.")
				}senao{
					escreva("\n O jogador 2 escolhe primeiro. ")	
				}
			
				escreva("\n Os personagens são Goku e Vegeta. Pode começar escolhendo um deles para jogar: \n 1- Goku / 2 - Vegeta: ")
				leia(personagem)
			
				enquanto(personagem  < 1 ou personagem > 2){
					escreva("Escolha uma opção válida: ")
					leia(personagem)	
				}
			
				se(personagem == 1){
					escreva("\n Ótimo, você ecolheu o Goku.")
					escreva("\n O jogador 2 ficou com o Vegeta.")	
				}senao{
					escreva("\n Ótimo, você escolheu o Vegeta")
					escreva("\n O jogador 2 ficou com o Goku.")
				}


				//Sorteio de quem joga primeiro

				escreva("\n Para decidir quem irá jogar primeiro, será sorteado novamente entre 1 e 2, o número que sair será respectivo ao jogador que irá jogar primeiro:  ")
				turno = u.sorteia(1, 2)
				escreva("\n O número sorteado foi: ", turno)

				//Resetando posições dos jogadores
				
				jg1Pos = 1
				jg2Pos = 1

				//Inicio do game
				
				enquanto(jg1Pos < 20 ou jg2Pos < 20){
		
					//Turno do Jogador 1
				
					se(turno == 1){
						
						escreva("\n O jogador 1 está na casa: ", jg1Pos)
						escreva("\n Pressione qualquer número pra jogar: ")
						leia(vez)
						dado = u.sorteia(1, 6)


					se(jg1Pos + dado == 7){
						
						escreva("\n O seu turno foi pulado: ")
						turno = 2
						jg1Pos = jg1Pos + 6
						
					}senao{
						
						escreva("\n O número sortedo no dado foi: ", dado)
						escreva("\n O número de casas que o jogador 1 irá andar será: ", dado)
						jg1Pos += dado
							
					}
				
					//Verificação das casas com efeitos especiais
				
					se(jg1Pos == 2){

						escreva("\n Você caiu na casa 2, pule para a casa 5.")
						escreva("\n O jogador 1 pulou para a casa 5")
						jg1Pos = 5 	
					}

					se(jg1Pos == 3){
						
						escreva("\n Você caiu na casa 3")
						escreva("\n Será sorteado um dado adicional, para redefinir sua casa.")
						dadoAdicional = u.sorteia(1,3)
						jg1Pos += dadoAdicional	
						escreva("\n A nova casa do jogador 1 é: ", jg1Pos)			
					}
				
				
					se(jg1Pos == 10){
						escreva("\n Você caiu na casa 10, troque de posição com o jogador 2.")
						escreva("\n Você trocou de posição com o jogador 2. ")
						temp = jg1Pos
						jg1Pos = jg2Pos
						jg2Pos = temp
					}

					se(jg1Pos == 12){
						escreva("\n Você caiu na casa 12, retorne uma casa. ")
						escreva("\n O jogador 1  retornou uma casa: ")
						jg1Pos = jg1Pos - 1	
					}

					se(jg1Pos == 15){
						
						escreva("\n Cante um trecho de uma música ou volte duas casas: ")
						escreva("\n Digite 1 para cantar, 2 para voltar duas casas: ")
						leia(opcao)
					
					se(opcao == 1){
						
						escreva("\n Cante a música escolhida pelo outro jogador: ")
						
						}senao se(opcao == 2){
							
							jg1Pos = jg1Pos - 2
							escreva("\n O jogador 1 voltou duas casas: ")	
								
						}senao{
							
							enquanto(opcao != 1 ou opcao != 2){
								escreva("\n Escolha uma opção válida: ")
								leia(opcao)	
							}	
						}
					}

					se(jg1Pos == 19){

						escreva("\n Você caiu na casa 19. ")
						escreva("\n HAHAHA, achou que ia ganhar, volte para a casa 1:")
						jg1Pos = 1	
					}

					//Vitória do Jogador 1
				
					se(jg1Pos >= 20){
						jg1Pos = 20
						escreva("\n Parabens, você chegou a casa de número 20. ")
						escreva("\n A vitória é do jogador 1")	
						vitoria1 ++
						pare
					}

					//Fim do Turno do jogador 1
					escreva("\n O jogador 1 está na casa: ", jg1Pos)
					escreva("\n Vez do jogador 2.")
					turno = 2
				
					}senao se(turno == 2){

						escreva("\n O jogador 2 está na casa: ", jg2Pos)
						escreva("\n Pressione qualquer número pra jogar: ")
						leia(vez)
						dado = u.sorteia(1, 6)
					
					se(jg2Pos + dado == 7){
						escreva("\n O seu turno foi pulado: ")
						turno = 1
						jg2Pos = jg2Pos + 6
					}senao{
						escreva("\n O número sortedo no dado foi: ", dado)
						escreva("\n O número de casas que o jogador 2 irá andar será: ", dado)
						jg2Pos += dado
					}

					//Verificação das casas com efeitos especiais
				

					se(jg2Pos == 2){
						
						escreva("\n Você caiu na casa 2, pule para a casa 5.")
						escreva("\n O jogador 2 pulou para a casa 5")
						jg2Pos = 5 	
					}

					se(jg2Pos == 3){
						
						escreva("\n Você caiu na casa 3")
						escreva("\n Será sorteado um dado adicional, para definir sua casa")
						dadoAdicional = u.sorteia(1,3)
						jg2Pos += dadoAdicional
						escreva("\n A nova casa do jogador 2 é: ", jg2Pos)				
					}
				
					se(jg2Pos == 10){

						escreva("\n Você caiu na casa 10, troque de posição com o jogador 2.")
						escreva("\n Você trocou de posição com o jogador 1. ")
						temp = jg2Pos
						jg2Pos = jg1Pos
						jg1Pos = temp
					}

					se(jg2Pos == 12){

						escreva("\n Você caiu na casa 12, retorne uma casa. ")
						escreva("\n O jogador 2 irá retornar uma casa: ")
						jg2Pos = jg2Pos - 1	
					}

					se(jg2Pos == 15){
						
						escreva("\n Cante um trecho de uma música ou volte duas casas: ")
						escreva("\n Digite 1 para cantar, 2 para voltar duas casas: ")
						leia(opcao)
					
						se(opcao == 1){
							
							escreva("\n Cante a música escolhida pelo outro jogador: ")
							
						}senao se(opcao == 2){
							
							jg2Pos = jg2Pos - 2
							escreva("\n O jogador 2 voltou duas casas: ")		
						}
					}

					se(jg2Pos == 19){
						escreva("\n Você caiu na casa 19. ")
						escreva("\n HAHAHA, achou que ia ganhar, volte para a casa 1:")
						jg2Pos = 1	
					}

					//Vitória do Jogador 2

					se(jg2Pos > 20){
						
						jg2Pos = 20
						escreva("\n Parabens, você chegou a casa de número 20. ")
						escreva("\n A vitória é do jogador 2")	
						vitoria2 ++
						pare
					}

					//Fim do Turno do jogador 2
					
					escreva("\n O jogador 2 está na casa: ", jg2Pos)
					escreva("\n Vez do jogador 1.")
					turno = 1
				
					}
					
				}
		
			}senao{
				// Verificar placar final
				se(iniciar == 2){
					escreva("\n O placar final foi: ", "\n O jogador 1 terminou na casa: ", jg1Pos, "\n O jogador 2 terminou na casa: ", jg2Pos)
					escreva("\n Número de vitórias do Jogardor 1: ", vitoria1)
					escreva("\n Número de vitórias do Jogardor 2: ", vitoria2)
					escreva("\n Placar Geral: ", vitoria1, "X", vitoria2)
					iniciar =  1
				}senao{ 
					// Sair do game
					se(iniciar == 3){
					escreva("Obrigado por jogar, espero que tenha se divertido")
					iniciar  = -1 	
					}	
				}
			}
		}


	}
}
 
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1879; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {jg1Pos, 11, 10, 6}-{jg2Pos, 11, 22, 6}-{vitoria1, 11, 34, 8}-{vitoria2, 11, 48, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */