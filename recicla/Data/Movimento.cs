namespace Recicla.Data
{
    public class Movimento
    {                
        #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o tipo de movimento: E ou S.
        /// </summary>
        public string tipo { get; set; }
        /// <summary>
        /// Obtém ou define a data do movimento.
        /// </summary>
        public DateTime data_mov { get; set; }
        /// <summary>
        /// Obtém ou define o ID da pessoa.
        /// </summary>
        public int pessoa_id { get; set; }
        /// <summary>
        /// Obtém ou define o nome da pessoa.
        /// </summary>
        public string pessoa { get; set; }
        /// <summary>
        /// Obtém ou define o ID da empresa que está fazendo a movimentação.
        /// </summary>
        public int empresa_id { get; set; }
        /// <summary>
        /// Obtém ou define o nome da empresa.
        /// </summary>
        public string empresa { get; set; }
        /// <summary>
        /// Obtém ou define se o movimento está fechado.
        /// </summary>
        public bool flag_fechado { get; set; }
        /// <summary>
        /// Obtém ou define a situação do movimento.
        /// D: Devendo.
        /// P: Pago.
        /// </summary>
        public string situacao { get; set; }
        /// <summary>
        /// Obtém ou define o valor total do movimento.
        /// </summary>
        public decimal valor_total { get; set; }
        /// <summary>
        /// Obtém ou define o valor pago do movimento.
        /// </summary>
        public decimal valor_pago { get; set; }
        /// <summary>
        /// Obtém ou define o valor do troco.
        /// </summary>
        public decimal troco { get; set; }
        /// <summary>
        /// Obtém ou define o valor de desconto.
        /// </summary>
        public decimal desconto { get; set; }
        /// <summary>
        /// Obtém ou define o ID do usuário.
        /// </summary>
        public int usuario_id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do usuário.
        /// </summary>
        public string usuario { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        /// <summary>
        /// Obtém ou define uma lista de materiais.
        /// </summary>
        public List<MovimentoMaterial> materiais { get; set; }
        /// <summary>
        /// Obtém ou define uma lista de pagamentos.
        /// </summary>
        public List<Pagamento> pagamentos { get; set; }
        #endregion
        
        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe Movimento.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public Movimento() {
            this.materiais = new List<MovimentoMaterial>();
            this.pagamentos = new List<Pagamento>();
            this.SetDefaultValues();
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.tipo = string.Empty;
            this.data_mov = DateTime.Now;
            this.pessoa_id = 1;
            this.pessoa = "CLIENTE PADRÃO";
            this.empresa_id = -1;
            this.empresa = string.Empty;
            this.materiais.Clear();
            this.pagamentos.Clear();
            this.situacao = string.Empty;
            this.valor_total = 0;
            this.valor_pago = 0;
            this.troco = 0;
            this.desconto = 0;
            this.usuario_id = 0;
            this.usuario = string.Empty;
            this.ativo = true;
        }
        #endregion
    }
}