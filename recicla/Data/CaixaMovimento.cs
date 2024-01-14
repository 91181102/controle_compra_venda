namespace Recicla.Data 
{
    public class CaixaMovimento
    {
         #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define a data do movimento.
        /// </summary>
        public DateTime data_mov { get; set; }
        /// <summary>
        /// Obtém ou define a descrição do movimento.
        /// Tamanho: 150.
        /// </summary>
        public string memorando { get; set; }
        /// <summary>
        /// Obtém ou define o ID do caixa.
        /// </summary>
        public int caixa_id { get; set; }
        /// <summary>
        /// Obtém ou define o ID do usuário.
        /// </summary>
        public int usuario_id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do usuário que fez o movimento.
        /// </summary>
        public string usuario { get; set; }
        /// <summary>
        /// Obtém ou define o valor do movimento.
        /// </summary>
        public decimal quantia { get; set; }
        /// <summary>
        /// Obtém ou define se a operação pe Entrada ou Saída.
        /// </summary>
        public string tipo { get; set; }
        /// <summary>
        /// Obtém ou define o valor de débito.
        /// </summary>
        public decimal debito {
            get {
                if (tipo == "S") return quantia;
                else return 0; } }
        /// <summary>
        /// Obtém ou define o valor de crédito.
        /// </summary>
        public decimal credito {
            get {
                if (tipo == "E") return quantia;
                else return 0; } }
        /// <summary>
        /// Obtém ou define o saldo do movimento.
        /// </summary>
        public decimal saldo { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        private string errorField = string.Empty;
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe CaixaMovimento.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public CaixaMovimento() {
            this.SetDefaultValues();            
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;            
            this.data_mov = DateTime.Now;
            this.memorando = string.Empty;
            this.caixa_id = 1;
            this.usuario_id = 0;
            this.usuario = string.Empty;
            this.quantia = 0;
            this.tipo = string.Empty;
            this.saldo = 0;
            this.ativo = true;
        }
        #endregion
    }
}