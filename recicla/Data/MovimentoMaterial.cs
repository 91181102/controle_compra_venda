namespace Recicla.Data
{
    public class MovimentoMaterial
    {
        #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define a ordem do item no pedido.
        /// </summary>
        public int ordem { get; set; }
        /// <summary>
        /// Obtém ou define o ID do movimento.
        /// </summary>
        public int movimento_id { get; set; }
        /// <summary>
        /// Obtém ou define o ID do material.
        /// </summary>
        public int material_id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do material.
        /// </summary>
        public string material { get; set; }
        /// <summary>
        /// Obtém ou define o saldo do material.
        /// </summary>
        public decimal qtd { get; set; }
        /// <summary>
        /// Obtém ou define a quantidade de volumes do material.
        /// </summary>
        public decimal vl_unit { get; set; }
        /// <summary>
        /// Obtém ou define a quantidade de volumes.
        /// </summary>
        public int volumes { get; set; }
        /// <summary>
        /// Obtém ou define o total do registro.
        /// </summary>
        public decimal vl_total {
            get {
                if (vl_totalField > 0) return vl_totalField;
                else return this.qtd * this.vl_unit; }
        }
        /// <summary>
        /// Obtém ou define a situação do registro.
        /// </summary>
        public string situacao { get; set; }
        /// <summary>
        /// Obtém ou define o ID do usuario.
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
        private decimal vl_totalField = 0;
        private bool is_canceledField = false;
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe Material.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public MovimentoMaterial() {
            this.SetDefaultValues();
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.movimento_id = -1;
            this.material_id = 0;
            this.material = string.Empty;
            this.situacao = "N";
            this.qtd = 0;
            this.vl_unit = 0;
            this.volumes = 0;
            this.ativo = true;
            this.usuario = string.Empty;
            this.usuario_id = -1;
        }
        #endregion
    }
}