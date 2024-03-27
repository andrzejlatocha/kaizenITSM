using AutoMapper;
using kaizenITSM.Domain.Dtos.hd;
using kaizenITSM.Domain.Entities.hd;

namespace kaizenITSM.Api.Data
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<ActionNoteDto, Actions>().ReverseMap();
            CreateMap<ActionTaskDto, Actions>().ReverseMap();
            CreateMap<ActionMessageDto, Actions>().ReverseMap();
        }
    }
}
