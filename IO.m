classdef IO
   methods(Static)
       function mat = load_mice(mouse_id,time,recording)
         file = dir(['/N/slate/zw72/allfiles/Mouse' num2str(mouse_id) '-*-P' num2str(time) '-fc' num2str(recording) '.mat']);
         file_path = fullfile(file.folder,file.name);
         mat = load(file_path);
       end
       function time_periods = get_time_periods()
           time_periods = {'15','22','28','35','60'};
       end
       function isbrain = load_brain_mask(mousei)
           mat = IO.load_mice(mousei,15,1);
           isbrain = mat.isbrain2;
       end
   end
end