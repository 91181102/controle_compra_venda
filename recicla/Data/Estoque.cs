namespace Recicla.Data
{
    public class Estoque
    {
        #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o ID da empresa que está fazendo a movimentação.
        /// </summary>
        public int empresa_id { get; set; }
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
        public decimal saldo { get; set; }
        /// <summary>
        /// Obtém ou define a quantidade de volumes do material.
        /// </summary>
        public int volumes { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe Estoque.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public Estoque() {
            this.SetDefaultValues();
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.material_id = 0;
            this.material = string.Empty;
            this.empresa_id = 0;
            this.saldo = 0;
            this.volumes = 0;
            this.ativo = true;
        }
        #endregion
    }
}