# 1. Critical flows

#### i. Endereço
Neste fluxo o usuário que acessa a home do Zé tem que informar o endereço que está para poder visualizar os produtos e valores que atendem a sua região. Apesar de ser um fluxo que provavelmente o usuário verá apenas uma vez este é o provável primeiro contato do cliente com a plataforma, então qualquer problema durante a experiência do usuário neste primeiro contato o deixará inseguro e até impossibilitar o uso do site.
       
#### ii. Cadastro de usuários  

No cadastro o usuário informa os seus dados e concorda com os termos de uso da plataforma, política de privacidade e campanhas de marketing. Novamente pensando no funil de conversão, por mais que este usuário não consiga fazer uma compra, este seria um fluxo chave para garantirmos que no mínimo temos o lead de um cliente em potencial e poder chamá-lo de volta a plataforma.
  
#### iii. Adicionar produto a sacola
Aqui o usuário já encontrou o seu produto na prateleira e quer colocá-lo na sua sacola. Já que todos merecem uma bebida, deixar este fluxo funcionando tem que ser uma prioridade nossa. Por mais que o fluxo de pagamento esteja em manutenção ou ocorra algum outro problema com o pagamento do cliente, caso ele esteja logado será possível salvar a sua intenção de compra e podemos nos comunicar mais diretamente com ele, trazendo ele de volta a plataforma caso a manutenção já tenha finalizado ou mesmo com campanhas de marketing mais direcionadas.

# 2. UI automation test

Para esta suite de testes eu escolhi usar Python como linguagem, já que é a linguagem mais usada na empresa, deste modo facilitaria a troca de conhecimentos com outros desenvolvedores. O framework escolhido foi o Robot, por ser open source e um dos mais utilizados com esta linguagem, além de trabalhar com uma linguagem ubiqua que facilita o aprendizado e a biblioteca do seleium, por já ter um conhecimento prévio. Apesar de nunca ter utilizado esta linguagem e framework em pouco tempo consegui elaborar esta suite, que provavelmente ainda peca em algumas boas práticas, mas acredito que valeu pelo aprendizado.

### Requisitos

- [Python](https://www.python.org/downloads/)
- [Chrome driver](https://chromedriver.chromium.org/downloads) compatível com o seu Chrome

#### Instalando dependências

    pip3 install -r requirements.txt

#### Executando os Testes

Com todas as dependências instaladas você deve estar pronto para executar os testes. Você deverá informar um usuário e senha ao teste nas variáveis `EMAIL` e `PASS`, como no exemplo abaixo:

    robot -v EMAIL:zedelivery@yopmail.com  -v PASS:Teste123456 -d ./results ./tests/ui/bag.robot

# 3. API automation test

Para executar os testes do endpoint weather da API Open Weather é só informar a variável API_KEY com a chave da API, como no exemplo abaixo:

    robot -v API_KEY:641df9381bbf93513a56728480829c06 -d ./results ./tests/api/weather.robot