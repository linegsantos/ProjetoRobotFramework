*** Settings ***
Library         String
Library         OperatingSystem
Library         DateTime
Library         Process

*** Variables ***

*** Keywords ***

# Caso de teste 1 - Pegando data e hora atuais
Teste pegando data atual
    ${AGORA}    Get Current Date     result_format=%d-%m-%y
    Log         ${AGORA}

Teste pegando data e hora atuais
    ${AGORA}    Get Current Date     result_format=%Y-%m-%dT%H:%M:%S
    Log         ${AGORA}

Teste pegando ano - mês - dia separadamente
    ${HOJE}     Get Current Date
    ${HOJE}     Convert Date   ${HOJE}   datetime
    Log         ${HOJE.day}-${HOJE.month}-${HOJE.year}

Trabalhando com tempo
    ${HORA}     Convert Time	1 minute 30 seconds
    Log         São ${HORA} segundos em 1 minuto e 30 segundos!
    ${HORA}     Convert Time	5400   verbose
    Log         5400 segundos é ${HORA}!
    ${HORA}     Convert Time	5500   timer   exclude_millis=yes
    Log         5500 segundos é ${HORA}!

Adicionando tempo de data
    ${ANTES}    Get Current Date
    ${DEPOIS}   Add Time To Date    ${ANTES}   4 hours   result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}
    ${ANTES}    Get Current Date
    ${DEPOIS}   Add Time To Date    ${ANTES}   7 days    result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}

Subtraindo tempo de data
    ${ANTES}    Get Current Date
    ${DEPOIS}   Subtract Time From Date    ${ANTES}   25 minutes    result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}
    ${ANTES}    Get Current Date
    ${DEPOIS}   Subtract Time From Date    ${ANTES}   2 days        result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}

Caso de teste 2 - Lidando com linhas de um texto String
Pega arquivo
    ## Lembrando: O GET FILE retorna o conteúdo do arquivo em STRING!
    ${CONTEUDO_ARQUIVO}    Get File    C:\\Users\\aline.goncalves\\Downloads\\String\\String\\my_files\\arquivo_texto_linhas.txt
    [Return]        ${CONTEUDO_ARQUIVO}

Contando as linhas
    ${STRING}       Pega arquivo
    ${LINHAS}       Get Line Count   ${STRING}
    Log             Meu arquivo tem: ${LINHAS} linhas!!

Pegando uma linha específica
    ${STRING}       Pega arquivo
    ${LINHA_3}      Get Line    ${STRING}    3
    Log             Conteúdo da linha 03 do arquivo:\n"${LINHA_3}"
    FOR  ${NUMERO_LINHA}   IN RANGE   0   6
         ${CONTEUDO_LINHA}      Get Line    ${STRING}   ${NUMERO_LINHA}
         Log     Conteúdo da linha ${NUMERO_LINHA} do arquivo:\n"${CONTEUDO_LINHA}"
    END

Pegando uma linha específica com a palavra "${PALAVRA}"
    ${STRING}       Pega arquivo
    ${LINHA}        Get Lines Containing String    ${STRING}    ${PALAVRA}
    Log             Linha com ${PALAVRA}:\n"${LINHA}"

Pegando até um marcador
    ## Use a variável fixa ${SPACE} para o Robot entender que
    ## você quer considerar espaço em branco
    ${STRING}       Pega arquivo
    ${LINHA}        Get Line    ${STRING}    0
    ${COMECO}       Fetch From Left    ${LINHA}    0
    ${FIM}          Fetch From Right   ${LINHA}    linha${SPACE}
    Log   Começo: "${COMECO}"\nFim:"${FIM}"\n\nTudo junto: "${COMECO}${FIM}"

# Caso de teste 3 - Manipulando a String
Substituindo valores no texto
    ${TEXTO}        Pega arquivo
    ${NOVO_TEXTO}   Replace String    string=${TEXTO}    search_for=Minha linha    replace_with=Conteúdo da minha linha
    Log             O velho texto era assim:\n${TEXTO}\nO novo texto ficou assim:\n${NOVO_TEXTO}
    Create File     ./my_files/meu_novo_arquivo.txt      ${NOVO_TEXTO}

Quero tudo minúsculo!
    ${TEXTO}        Pega arquivo
    ${TEXTO}        Convert To Lowercase    ${TEXTO}
    Log             Meu texto todo minúsculo:\n${TEXTO}

Quero tudo maiúsculo!
    ${TEXTO}        Pega arquivo
    ${TEXTO}        Convert To Uppercase    ${TEXTO}
    Log             Meu texto todo maiúsculo:\n${TEXTO}

# Caso de teste 4 - Abrindo programas com a library Process
## Inicia o processo e não espera por resposta dele
    ## Lembrete: Para caminhos no Windows use barras duplas!!

Abra e feche o Notepad
    ${MEU_PROCESSO}     Start Process    C:\\WINDOWS\\system32\\notepad.exe
    Sleep  3s
    Terminate Process   ${MEU_PROCESSO}   kill=True

# Caso de teste 5 - Execute comandos de prompt

 Executando comandos diversos de prompt
 ## Use o atributo shell=True para habilitar funções de shell,
    ## como criar um diretório, por exemplo
    Run Process    mkdir robot_teste   cwd=${CURDIR}   shell=True