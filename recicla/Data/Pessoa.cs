namespace Recicla.Data 
{
    public class Pessoa
    {
         #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do pessoa.
        /// </summary>
        public string nome { get; set; }
        /// <summary>
        /// Obtém ou define o cnpj ou cpf da pessoa.
        /// </summary>
        public string cnpj_cpf { get; set; }
        /// <summary>
        /// Obtém ou define o endereço da pessoa.
        /// </summary>
        public string endereco { get; set; }
        /// <summary>
        /// Obtém ou define uma observação da pessoa.
        /// </summary>
        public string obs { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        /// <summary>
        /// Obtém ou define uma lista de contatos da pessoa.
        /// </summary>
        public List<PessoaContato> contatos { get; set; }
        #endregion

        #region: Construtor
        /// <summary>
        /// Cria uma nova instância da classe Usuario.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public Pessoa() {            
            this.contatos = new List<PessoaContato>();
            this.SetDefaultValues();
        }

        /// <summary>
        /// Retorna a classe para valor padrão.
        /// </summary>
        /// <![CDATA[14/01/2024]]>
        public void SetDefaultValues() {
            this.id = -1;
            this.nome = string.Empty;
            this.cnpj_cpf = string.Empty;
            this.endereco = string.Empty;
            this.obs = string.Empty;
            this.contatos.Clear();
            this.ativo = true;
        }
        #endregion
    }
}