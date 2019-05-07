﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Security;
using System.Net.Sockets;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace WebServiceData.CServer
{
    public class Client
    {
        private TcpClient client;
        private NetworkStream ns;
        private SslStream sl;
        private byte[] data;
        private bool connected = false;
        public BinaryReader read;
        public Client()
        {

            client = new TcpClient("localhost", 3001);
            ns = client.GetStream();
            connected = true;
            var ssl = new X509Certificate(File.ReadAllBytes("C:\\Users\\266757\\Downloads\\pubkey.cer"));

            sl = new SslStream(ns, false, new RemoteCertificateValidationCallback(ValidateServerCertificate), null);
            sl.AuthenticateAsClient("bridge");
            read = new BinaryReader(sl);

        }


        public static bool ValidateServerCertificate(
            object sender,
              X509Certificate certificate,
              X509Chain chain,
              SslPolicyErrors sslPolicyErrors
            )
        {
            return true;
        }


        public void SendMsg(string msg)
        {
            if (connected)
            {
                byte[] response = new byte[1024];
                response = Encoding.UTF8.GetBytes(msg + '\0');
                sl.Write(response, 0, response.Length);

                byte c;
                MemoryStream memoryStream = new MemoryStream();
                while ((c = read.ReadByte()) != 0)
                {
                    memoryStream.WriteByte(c);
                }
                string console;
                console = Encoding.UTF8.GetString(memoryStream.ToArray());
                Console.WriteLine(console);
            }
        }
    }
}
