classdef PID_Class
   properties
      mKp;mKd;mKi,mdt;mCurrentE;mPrevE = 0, mIntegral = 0;
   end
   
   methods
%% Constructor
        function PID = PID_Class(aKp,aKd,aKi,adt)
         if nargin > 0
            PID.mKp = aKp;
            PID.mKd = aKd;
            PID.mKi = aKi;
            PID.mdt = adt;
         end
      end
%% 
        function output = calcControl(PID,setPoint,currentState)
            PID.mCurrentE = setPoint - currentState;
            Pout = PID.mCurrentE * PID.mKp;
            Dout = ((PID.mCurrentE-PID.mPrevE)/PID.mdt)*PID.mKd;
            PID.mPrevE=PID.mCurrentE;
            
            
            integral = PID.mCurrentE * PID.mdt;
            PID.mIntegral = PID.mIntegral+ integral;
            Iout = PID.mIntegral* PID.mKi;
            
            
            output = Pout+Dout+Iout;
        end
      
   end
end
