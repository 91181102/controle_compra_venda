namespace Recicla.Data 
{
    public class PessoaContato
    {
        #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o tipo de contato.
        /// </summary>
        public string tipo { get; set; }
        /// <summary>
        /// Obtém ou define o valor do contato.
        /// </summary>
        public string contato { get; set; }
        /// <summary>
        /// Obtém ou define uma observação.
        /// </summary>
        public string obs { get; set; }
        /// <summary>
        /// Obtém ou define a data de pagamento.
        /// </summary>
        public int pessoa_id { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe PessoaContato.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public PessoaContato() {
            this.SetDefaultValues();
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.tipo = string.Empty;
            this.contato = string.Empty;
            this.obs = string.Empty;
            this.pessoa_id = -1;
            this.ativo = true;
        }
        #endregion
    }
}