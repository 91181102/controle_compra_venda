namespace Recicla.Data
{
    public class Material
    {
         #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o ID da empresa que está fazendo a movimentação.
        /// </summary>
        public string nome { get; set; }
        /// <summary>
        /// Obtém ou define o ID do material.
        /// </summary>
        public int tipo_material_id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do material.
        /// </summary>
        public string tipo_material { get; set; }
        /// <summary>
        /// Obtém ou define o saldo do material.
        /// </summary>
        public decimal preco_compra { get; set; }
        /// <summary>
        /// Obtém ou define a quantidade de volumes do material.
        /// </summary>
        public decimal preco_venda { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe Material.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public Material() {
            this.SetDefaultValues();
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.nome = string.Empty;
            this.tipo_material_id = 0;
            this.tipo_material = string.Empty;
            this.preco_compra = 0;
            this.preco_venda = 0;
            this.ativo = true;
        }
        #endregion
    }
}