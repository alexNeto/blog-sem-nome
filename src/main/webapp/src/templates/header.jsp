<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
    <h1 id="logo"><a id="titulo-blog" href="${pageContext.request.contextPath}">Blog Sem Nome</a></h1>

    <div class="espaco"></div>

    <div class="drop-container">
        <c:choose>
            <c:when test="${estaLogado != null}">
                <button id="autenticacao" class="botao borda botao-header margem-inferior">
                    <p id="apelido">${apelido}</p>
                </button>
                <div class="drop-conteudo borda">
                    <div>
                        <c:if test="${tipoUsuario == 'ADM'}">
                            <a id="administrador" href="${pageContext.request.contextPath}/restrito/gerenciar" target="_blank">Gerenciar
                                Blog</a>
                        </c:if>
                        <a onclick="sair()">Sair</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <button id="autenticacao" class="borda botao">Autenticação</button>

                <div id="myModal" class="modal">
                    <div class="modal-body">
                        <div id="menu-autenticacao">
                            <div class="modal-header">
                                <span class="fecha"></span>
                            </div>
                            <div class="menu-padding">
                                <a onclick="preencherAutenticacao()">Entrar</a>
                            </div>
                            <div class="menu-padding">
                                <a onclick="preencherCadastro()">Cadastrar</a>
                            </div>
                        </div>
                        <div id="menu-entrar" hidden>
                            <div>
                                <input type="text" name="nomeUsuario" id="apelido" placeholder="Nome de Usuário">
                            </div>
                            <div>
                                <input type="password" name="senha" id="senha" placeholder="Senha">
                            </div>
                            <div class="botoes-autenticacao">
                                <button class="botao borda botao-header" onclick="preencherCadastro()" tabindex="-1">Cadastrar</button>
                                <button class="botao borda botao-header" onclick="fazAutenticacao()">Entrar</button>
                            </div>
                        </div>
                        <div id="menu-cadastrar" hidden>
                            <div>
                                <input type="text" name="nomeUsuario" id="novo-apelido" placeholder="Nome de Usuário">
                            </div>
                            <div>
                                <input type="text" name="email" id="email" placeholder="E-mail">
                            </div>
                            <div>
                                <input type="password" name="senha" id="nova-senha" placeholder="Senha">
                            </div>
                            <div>
                                <input type="password" name="confirmaSenha" id="confirma-senha" placeholder="Confirmação da Senha">
                            </div>
                            <div class="botoes-autenticacao">
                                <button class="botao borda botao-header" onclick="preencherAutenticacao()" tabindex="-1">Entrar</button>
                                <button class="botao borda botao-header" onclick="fazCadastro()">Cadastrar</button>
                            </div>
                        </div>
                    </div>
            </c:otherwise>
        </c:choose>
    </div>
</header>
<script src="src/js/autenticacao.js"></script>
<link rel="stylesheet" href="src/css/autenticacao.css">