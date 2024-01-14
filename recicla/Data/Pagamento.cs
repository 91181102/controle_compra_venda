namespace Recicla.Data 
{
    public class Pagamento 
    {
         #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o ID do movimento.
        /// </summary>
        public int movimento_id { get; set; }
        /// <summary>
        /// Obtém ou define o ID do tipo de pagamento.
        /// </summary>
        public int pagamento_tipo_id { get; set; }
        /// <summary>
        /// Obtém ou define o tipo de pagamento.
        /// </summary>
        public string pagamento_tipo { get; set; }
        /// <summary>
        /// Obtém ou define a data de pagamento.
        /// </summary>
        public DateTime data_pgto { get; set; }
        /// <summary>
        /// Obtém ou define o valor pago.
        /// </summary>
        public decimal valor_pago { get; set; }
        /// <summary>
        /// Obtém ou define o ID do usuário.
        /// </summary>
        public int usuario_id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do usuário.
        /// </summary>
        public string usuario { get; set; }
        /// <summary>
        /// Obtém ou define o tipo de operação.
        /// </summary>
        public string movimento_tipo { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe Empresa.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public Pagamento() {
            this.SetDefaultValues();            
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.movimento_id = -1;
            this.pagamento_tipo_id = -1;
            this.pagamento_tipo = string.Empty;
            this.data_pgto = DateTime.Now;
            this.valor_pago = 0;
            this.usuario_id = 0;
            this.usuario = string.Empty;
            this.ativo = true;
        }
        #endregion
    }
}