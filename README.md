# Projeto Springboot, API Rest, CI/CD, testes unitários, utilizando Docker, Jenkins, SonarQube, Selenium e Maven.

Aplicação em SpringBoot back e frontend utilizando integração contínua e entrega contínua, Docker, Jenkins, Sonar e mais, segue abaixo um resumo do projeto.

## Jenkins

No Jenkins foi criado um job tipo pipeline, apontando para o [Jenkinsfile](https://github.com/wregin/tasks-backend/blob/master/Jenkinsfile) onde estão apontado todos os estágios e passos do projeto.

![Config pipeline](https://github.com/wregin/tasks-backend/blob/master/showroom/config_pipeline.png?raw=true)

![jenkinsfile](https://github.com/wregin/tasks-backend/blob/master/Jenkinsfile)

Veja que ao subir a estrutura, todos os passos são executados pelo Jenkins.

![Jenkins pipeline](https://github.com/wregin/tasks-backend/blob/master/showroom/pipeline_stage_view.png?raw=true)

# SonarQube

Exemplo onde deu erro na quality gate, foi alterada a porcentagem de cobertura de forma que o projeto não atendeu o mínimo de 80% e assim não foi possível seguir.

![Erro na qualite gate](https://github.com/wregin/tasks-backend/blob/master/showroom/abaixo80.png?raw=true)

Após a alteração para cobertura de 70% o qualite gate permitiu seguir.

![Sonar coverage](https://github.com/wregin/tasks-backend/blob/master/showroom/sonar_abaixo80.png?raw=true)

# Selenium

Aqui o bacana é que com o selenium pode ser configurado os passos a serem executado no frontend do projeto, de forma que os campos são preenchidos, o botão é clicado e pega a mensagem de retorno para ser validado no java.

![console Selenium](https://github.com/wregin/tasks-backend/blob/master/showroom/selenium_chrome.png?raw=true)

Exemplo do código da configuração do Selenium.

![Exemplo do código que o Selenium executa](https://github.com/wregin/tasks-backend/blob/master/showroom/selenium_cod.png?raw=true)


# Curiosidades

Veja que para executar esses processos é necessária uma certa quantidade de memória, coloquei 10gb na máquina virtual e ainda sim acabou por utilizar a swap.

[](swap)
