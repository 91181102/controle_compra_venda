namespace Recicla.Data 
{
    public class Empresa
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
        /// Obtém ou define o email do empresa.
        /// </summary>
        public string email { get; set; }
        /// <summary>
        /// Obtém ou define a cnpj da empresa.
        /// </summary>
        public string cnpj { get; set; }
        /// <summary>
        /// Obtém ou define o endereço da empresa.
        /// </summary>
        public string endereco { get; set; }
        /// <summary>
        /// Obtém ou define o telefone da empresa.
        /// </summary>
        public string telefone { get; set; }
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
        public Empresa() {
            this.SetDefaultValues();            
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.nome = string.Empty;
            this.email = string.Empty;
            this.cnpj = string.Empty;
            this.endereco = string.Empty;
            this.telefone = string.Empty;
            this.ativo = true;
        }
        #endregion
    }

}