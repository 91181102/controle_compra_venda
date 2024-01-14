namespace Recicla.Data 
{
    public class PagamentoTipo
    {
         #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do empresa.
        /// </summary>
        public string nome { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe PagamentoTipo.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public PagamentoTipo() {
            this.SetDefaultValues();
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.nome = string.Empty;
            this.ativo = true;
        }
        #endregion
    }
}